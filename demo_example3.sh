mkdir images -p && mkdir results -p;
rm images/content3.png -rf;
rm images/style3.png -rf;
rm results/content3_seg.pgm -rf;
rm results/style3_seg.pgm -rf;
rm results/content3_seg.pgm.visualization.jpg -rf;
rm results/style3_seg.pgm.visualization.jpg -rf;
rm results/stylization_with_auto_segmentation.png -rf;
export PYTHONPATH=$PYTHONPATH:segmentation
cd images;
wget https://pre00.deviantart.net/f1a6/th/pre/i/2010/019/0/e/country_road_hdr_by_mirre89.jpg -O content3.png
wget https://inchiostro.unipv.it/wp-content/uploads/2017/10/Stranger_Things_S2_news_Images_V03-1024x481.jpg -O style3.png
convert -resize 50% content3.png content3.png;
convert -resize 50% style3.png style3.png;
cd ..;
python demo_with_ade20k_ssn.py --cuda 0 --output_visualization;
