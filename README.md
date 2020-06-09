# LidarMoose
## Analaysis of Lidar data at moose exclosure sites

This was originally Ingrid Bekken Snøan's [master project](https://ntnuopen.ntnu.no/ntnu-xmlui/handle/11250/2618099?locale-attribute=no) that was submitted and approved in 2019. The work was continuated by Ingrid and the other contributors to make a manuscript ready for publication.

## Workflow and issues/tasks
1. Get LiDAR data from hoydedata.no
    * 1 x 1 km around each site

    Eight new laz files for Hedemark was added October 2019, and are found at `T:\vm\inh\botanisk\Bruker\James\Ingrid LAS files\hedmark_new_las_version`. (These are not added to the `data/laz/` folder.) There are 36 files in `data/laz` (+ one called ex1.laz). Thats one less than what Ingrid used in the thesis (she used 37). With the 8 that was added that brings us up to 45. Total possible number of sites is (15+16+16) 47.

1. Convert laz (compressed) to las (uncompressed)
    * Files are here: `T:\vm\inh\botanisk\Bruker\James\Ingrid LAS files\`
    * I think this was done using laszip.exe by Ingrid, but James imported laz straight into R using `readLAS()` (se Clipping_script_32x32.R line 1760 or site Sørem 1).

1. Clip las files with a 6m buffer around each plot
    * [Issue 9](https://github.com/JamesDMSpeed/LidarMoose/issues/9): Imprecise plot coordinates.
    * Files are in: `data/clipped_las`.
    * James added Sorem, Nes 1 & 2, and Maarud 1, 2 & 3 in Nowember 2019

    There are two script files that look very similar: `Clipping script.R` and `Clipping_script_32x32x.R`. Assuming the latter is the most recent (it looks that way since James wrote in it in October 2019). These are very long scripts, and could potentially be shortened with a for-loop. That will also fix the [directories problem](https://github.com/JamesDMSpeed/LidarMoose/issues/7). To do that the three files with plot coordinated need to be standardised (see [issue 10](https://github.com/JamesDMSpeed/LidarMoose/issues/10)). Probably it's too much work at this stage.

1. `canopy_terrain_modeling.R`
    * Make canopy-, terrain-, and canopy height models for the 32 x 32 plot
    * Resolution is set to 1m
    * Identify trees above 5 m and remove those above 7 m. This might be too low a threshold now with the more recent LiDAR data from 2019?
    * Remove the 6m buffers
    * Remake  the canopy model
    * Write to: `data/canopy_height_clipped_raster`

    This folder contains too many files. This is because of a script called `Resolution.R` which produces canopy height models for the sites h_pramhus and verdal_1vb at different (higher?) resolution. These are saved with the ending '05'. In addition there are las files for these sites with the ending '0' that I don't know where come from. I don't think any of tese should be used, that they were just for testing. They're not imported by the `canopy_terrain_modelling.R` script. I have moved them to the subfolder `trash/`

1. Get summary data from the canopy height models
    * See: `AutomatedDataSummaryfromCanopyHeight.R`
    * depracated: `Making table.R`
    * Extract: median, median absoloute deviation (MAD), relative MAD (MAD/median).

1. Prepare field-based data
    * `Field_data.r`
    * Writes to `MyData5.csv` and `Data_prod_field`. Extracted variables are mean and median tree height at the 20x20 plot level, which is then divied by experimental duration to give yearly growth that is comparable to the LiDAR data.
    * Sustherb density dataset is downloaded from Natron and includes data from 2019

1. Calculate site productivity'
    * `site_prod_all_regions_2.R`
    * writes to: `data/Site_prod_all_regions.csv`.

    Uses harvested tree biomass data to make allometric models and calculate standing biomass and subsequantly annual biomass increments (growth, but not height growth). Productivity is mean annual biomass increment for either the exclosure (usually) or the open plot (if it grew faster).

1. Combine LiDAR data with all other data types/sources.
    * `compile.R`
    * depracated: `Merge_script.R`, `merge data frames.R`, `AnalysisNov2019.R` (first part)
    * writes to `data/compiledDataset.csv`

1. Analyses
    * `analysis.Rdm`
    * deparacated: `AnalysisNov2019.R` and `Plots and analysis.R`



## About the repo
* Large las files are stored at `T:\vm\inh\botanisk\Bruker\James\Ingrid LAS files`, as well as on Ingerid's computer `C:\Users\Ingrid\Documents\Master - Sustherb\orginale_las`, and on an external hard drive.
* Clipped las files, 32x32 m, are stored in `data/clipped_las`.
* Canopy height is stored in rasterformat in `data/canopy_height_clipped_raster` (20x20m). They are clipped because trees over 7 m has been excluded if present, since they most likely have been left standing during the clear cut.
* Results derived from the canopy height models are merged with the meta data table, this new table is called `MyData`.
