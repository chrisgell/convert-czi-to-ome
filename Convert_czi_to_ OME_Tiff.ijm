//Macro to convert a folder of .czi images to OME tif for processing in Huygens
//Chris Gell December 2018

path = getDirectory("Choose input directory"); 
outputFolder = getDirectory("Choose or create a directory to save results.");
filelist = getFileList(path); //load array of all files inside input directory

setBatchMode(true);
 
for (i=0; i< filelist.length; i++) {
     
   
         
    if (endsWith(filelist[i], ".czi")) {

 		 //Use Bio-formats for loading and exporting, note the string creates from the path and filename had to be in square brackets - not obvious.  
         run("Bio-Formats Importer", "open=["+path+filelist[i]+"] autoscale color_mode=Composite rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
         run("Bio-Formats Exporter", "save=[" + outputFolder + filelist[i] + ".ome.tif] export compression=Uncompressed");
     
 	}
}


setBatchMode(false);
close();