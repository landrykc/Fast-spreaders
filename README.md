# Fast-spreaders
Term Group Project for EESC6664.01 Environmental Data Exploration & Analysis

Collaborators: [Kameko](https://github.com/landrykc), [Charlotte](https://github.com/charlorthioir), [Skylar](https://github.com/skyfay364), [Adam](https://github.com/yueqian-w)

---

### Project Title

*The characteristics of divergent tectonic boundaries with fast-spreading and slow-spreading rates*

### Data Sources

- Ocean Bathymetry: [GMRT v3.9](https://www.gmrt.org/) via [GeoMapApp](http://www.geomapapp.org/)
- Earthquake Information: [USGS Catalog](https://earthquake.usgs.gov/earthquakes/search/#data)
- Geochemical Data Compilation: [PetDB | EarthChem](https://search.earthchem.org/)

### Scripts and Functions (MATLAB)

#### Data Preparation

- `Load_Data.m` - This script reads all data tables stored in the directory `./Data Files` and extracts fields of interest to create a reorganized database `all_data.mat` in MATLAB. Note that this script does not need to be executed because the database file has been provided in this repository. If you are making local modifications, however, you may need to return to this script and check if everything works properly and the database file is correctly generated.

#### Analysis

- `Bathymetry_Code.m` - This script produces top-down map views of seafloor bathymetry. 
- `Transect_Data_Code.m` - This script delineates seafloor depth variations across the mid-ocean ridge along each selected transect. The raw measurements are slightly smoothed and averaged to calculate the slope.
- `Earthquake_Data_Code.m` - This script creates maps of earthquake locations as well as associated magnitude distribution.
- `Chem_Data_Code.m` - This script generates Harker Diagrams to visualize various geochemical datasets and computes average chemical  composition.

#### Auxiliary Functions

- `grdread2.m` - This function reshapes the raw netCDF files for bathymetry that are directly exported from GeoMapApp. Thank our colleague [Emma](https://github.com/woodfordej) for sharing such a useful function.
- `cmocean.m` - This function is required to use visually better colormaps for bathymetry plots. This function is not explicitly included in this repository, but can be found [here](https://github.com/BC-EESC4464-SP21/Common-functions). You may need to add this function to your MATLAB searching path.

#### Figures

The figures contained in the folder `./Figures` are the direct output of those scripts described above. The filenames of the figures should give you a clue about their origin. 

### Usage

All code in this repository is in the form of simple Matlab scripts and functions, which can be run in MATLAB with one click. Detailed information is also provided inside each script. If you run into any errors or have any questions, please contact us: [Kameko](mailto:landrykc@bc.edu), [Charlotte](mailto:lorthioi@bc.edu), [Skylar](mailto:goliber@bc.edu), [Adam](mailto:wangagk@bc.edu).

<!-- Last Updated: May, 2021 -->

