# NOTES LECTURE FOOD DELIVERY DAY ONE!

-> Welcome to your food delivery experience. This is a 2 day assignment where will be working with multiple models.

Now I want to show you some good practices and way to start working with multiple models.

Code the Patient. Show them hash as last argument and why its better for argument order dependency
and you dont need to offer all the data
If the hash is the last argument your passing to a method the hash brackets are optional!

Show them to use hash as a last argument for the method

PATIENT -> HASH AS LAST ARGUMENT
ROOM -> STATE & BEHAVIOUR.
will have patients and a capacity

Make them linked!
patient.room = self
room.add_patient(patient)

# show them what happens in memory on the white board
But we cant actually put objects into the CSV so we have to save it in a different way

to save it -> Create the lines of the database, the way it would look based on an excel sheet. Ask them how they would show it in their database. Now how do we make sure that we know what patients belong to what room? Where do we save it?

# write the PatientRepository and show them the next id logic
# psuedo the roomrepo

# DESERIALIZATION -> creating complex in-memory structure from a text file, deserialization is going from a text file back to an object and all the needed relations

# SERIALIZATION -> turning a text file into in-memory structure. It is storing the object in such a way that it can be 'recreated' in-memory

write an appointment model for a hospital

we call this a foreign_key, because it is referencing a foreign key, an id in a different table

walk through the food delivery!
