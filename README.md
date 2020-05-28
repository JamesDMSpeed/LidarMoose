# LidarMoose
## Analaysis of Lidar data at moose exclosure sites

This was originally Ingrid Bekken Snøan's [master project](https://ntnuopen.ntnu.no/ntnu-xmlui/handle/11250/2618099?locale-attribute=no) that was submitted and approved in 2019. The work was continuated by Ingrid and the other contributors to make a manuscript ready for publication. 

## Simplified workflow
1. Get LiDAR data from hoydedata.no
* 1 x 1 km around each site
* Files are here: `T:\vm\inh\botanisk\Bruker\James\Ingrid LAS files`

2. Convert laz to las

3. Clip las files with a 6m buffer around each plot
* [Issue 9](https://github.com/JamesDMSpeed/LidarMoose/issues/9): Imprecise plot coordinates. 
* Files are in: `data/clipped_las`
* James added Sorem, Nes 1 & 2, and Maarud 1, 2 & 3 in Nowember 2019

    There are two script files that look very similar: `Clipping script.R` and `Clipping_script_32x32x.R`. These are very long, and should perhaps be shortened with a for-loop. That will also fix the [directories problem](https://github.com/JamesDMSpeed/LidarMoose/issues/7). 

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
    
9. Get summary data from the canopy height models
    * See: `AutomatedDataSummaryfromCanopyHeight.R`
    * median
    * median absoloute deviation (MAD)
    * relative MAD (MAD/median)
    
10. Prepare field-based data
    * The script is called `Field_data.r` but it's very long



## About the repo
* Large las files are stored at `T:\vm\inh\botanisk\Bruker\James\Ingrid LAS files`, as well as on Ingerid's computer `C:\Users\Ingrid\Documents\Master - Sustherb\orginale_las`, and on an external hard drive. 
* Clipped las files, 32x32 m, are stored in `data/clipped_las`. 
* Canopy height is stored in rasterformat in `data/canopy_height_clipped_raster` (20x20m). They are clipped because trees over 7 m has been excluded if present, since they most likely have been left standing during the clear cut. 
* Results derived from the canopy height models are merged with the meta data table, this new table is called `MyData`. 
