#!/bin/bash

function coltomatrix() {

  awk '{ 
      # Handle NaN explicitly
      if ($3 == "NaN") {
          matrix[$1, $2] = "NaN";
      } else {
          matrix[$1, $2] = $3 + 0; # Force conversion to number
      }
      if ($1 > max_x) max_x = $1;
      if ($2 > max_y) max_y = $2;
     } 
     END { 
         for (i = 0; i <= max_x; i++) { 
             for (j = 0; j <= max_y; j++) {
                 if (matrix[i, j] == "NaN") {
                     printf "NaN ";
                 } else {
                     printf "%.10g ", matrix[i, j]; # Print numbers properly
                 }
             }
             printf "\n"; 
         } 
  }' $1

}

coltomatrix $1
