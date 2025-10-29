surface = 0   #surface, which is zero
m1 = 5    #midpoint 1
m2 = 25   #midpoint 2
m3 = 42.5 #midpoint 3

# first crack to brute force it

#what is the distance between the first midpoint and the surface (0)
m1_dist = m1 - surface

#get first layer thickness by doubling midpoint (m1) value
first_layer_thickness = m1_dist * 2
first_layer_top = surface
first_layer_bottom = first_layer_thickness

#get second layer distance
m2_dist = m2 - first_layer_bottom

#get second layer thickness
second_layer_bottom = first_layer_thickness + (m2_dist * 2)
second_layer_top = first_layer_bottom
second_layer_thickness = second_layer_bottom - first_layer_bottom

#get layer 3 distance
m3_dist = m3 - second_layer_bottom

#get third layer thickness
third_layer_bottom = second_layer_bottom + (m3_dist * 2)
third_layer_top = second_layer_bottom
third_layer_thickness = third_layer_bottom - second_layer_bottom


# oh, ok. We have the _correct_ values, but this really only works for this specific example.
# Also, while we have the correct values, we weren't asked for the values :)
# We were asked for an algorithm to compute the values.
# While the above is practically useless, it helps me organize my head to structure the loop(s).

# Trying again.  We want to: 
# 1. open a csv
# 2. check the header for columns with name 'midpoint'
# 3. calculates top and bottom values for each midpoint entry
# 4. save a csv with three columns: midpoint, top of layer, bottom of layer 
# 5. for the first value, use zero as the initial reference point -- e.g. the Earth's surface at that location

#start by hardcoding the surface value to zero
surface = 0

# open csv
df <- read.csv('algomiddy.csv')
head(df)



# dump results as csv
write.csv(output_df, 'midpoint_with_boundaries.csv')
print("Process complete. The file 'midpoint_with_boundaries.csv' has been saved.")