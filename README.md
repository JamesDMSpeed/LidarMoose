# LidarMoose
## Analaysis of Lidar data at moose exclosure sites

This was originally Ingrid Bekken Snøan's [master project](https://ntnuopen.ntnu.no/ntnu-xmlui/handle/11250/2618099?locale-attribute=no) that was submitted and approved in 2019. The work was continuated by Ingrid and the other contributors to make a manuscript ready for publication. 

## Workflow and issues/tasks
1. Get LiDAR data from hoydedata.no
    * 1 x 1 km around each site
    * They come as compreesed laz files (I think) and are stored in `data/laz/`. 
    
    New laz files for Hedemark was added October 2019, and are found at `T:\vm\inh\botanisk\Bruker\James\Ingrid LAS files\hedmark_new_las_version`. (I'm not sure if these are added to the `data/laz/` folder.) There are 36 files in `data/laz` (+ one called ex1.laz). Total possible number of sites is (15+16+16) 47, so we're missing 11 sites. 

2. Convert laz (compressed) to las (uncompressed)
    * Files are here: `T:\vm\inh\botanisk\Bruker\James\Ingrid LAS files\`

3. Clip las files with a 6m buffer around each plot
    * [Issue 9](https://github.com/JamesDMSpeed/LidarMoose/issues/9): Imprecise plot coordinates. 
    * Files are in: `data/clipped_las`. 
    
    92 items in folder, incl. ex_las and ex2.las. That would imply 45 sites, 9 more than we have laz files for. Not sure what's going on there.
    * James added Sorem, Nes 1 & 2, and Maarud 1, 2 & 3 in Nowember 2019

    There are two script files that look very similar: `Clipping script.R` and `Clipping_script_32x32x.R`. Assuming the latter is the most recent (it looks that way). These are very long scripts, and should perhaps be shortened with a for-loop. That will also fix the [directories problem](https://github.com/JamesDMSpeed/LidarMoose/issues/7). To do that the three files with plot coordinated need to be standardised (see [issue 10](https://github.com/JamesDMSpeed/LidarMoose/issues/10)). 

4. Make a canopy model
    * highest points, measured in meters above sea level
    
  This step, as well as 5, 6, 7, and 8, is done inside `canopy_terrain_modeling.R`. The script can be automated.
 
5. Make a terrain model

6. Make a canopy height model
    * subtracting the terrain model from the canopy model
    * resolution set to 1m
    
7. Remove large trees
  * These functions were used:
    * `lidR::tree_detection()`
    * `lidR::lastrees_dalponte()`
    * `lidR::tree_hulls()`
    * `lidR::lasclip()`
  * Trees over 7m tall were cut away. This might be too low now with the more recent LiDAR data from 2019?


8. Remove the 6m buffers
    * Resulting canopy height models (raster files) are stored in `data/canopy_height_clipped_raster`
    
    This folder contains too many files. This is because of a script called `Resolution.R` which produces canopy height models for the sites h_pramhus and verdal_1vb at different (higher?) resolution. These are saved with the ending '05'. In addition there are las files for these sites with the ending '0' that I don't know where come from. I don't think any of tese should be used, that they were just for testing. They're not imported by the `canopy_terrain_modelling.R` script.
    
9. Get summary data from the canopy height models
    * See: `AutomatedDataSummaryfromCanopyHeight.R`
    * depracated: `Making table.R`
    * Extract: median, median absoloute deviation (MAD), relative MAD (MAD/median)
    
10. Prepare field-based data
    * The script is called `Field_data.r` but it's very long



## About the repo
* Large las files are stored at `T:\vm\inh\botanisk\Bruker\James\Ingrid LAS files`, as well as on Ingerid's computer `C:\Users\Ingrid\Documents\Master - Sustherb\orginale_las`, and on an external hard drive. 
* Clipped las files, 32x32 m, are stored in `data/clipped_las`. 
* Canopy height is stored in rasterformat in `data/canopy_height_clipped_raster` (20x20m). They are clipped because trees over 7 m has been excluded if present, since they most likely have been left standing during the clear cut. 
* Results derived from the canopy height models are merged with the meta data table, this new table is called `MyData`. 
