# For use 

 docker run --rm -it openmicroscopy/octave                   # Octave shell
 docker run --rm -it --entrypoint bash openmicroscopy/octave # Bash shell
 docker run --rm openmicroscopy/octave -h                    # Get octave help
 docker run --rm openmicroscopy/octave example1.m arg1       # Run the example file
 docker run --rm -v $(pwd):/source openmicroscopy/octave /source/myfile.m
