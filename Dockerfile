FROM debian as build

RUN wget "http://naciscdn.org/naturalearth/packages/natural_earth_vector.sqlite.zip"

RUN unzip natural_earth_vector.sqlite.zip

FROM terranodo/datasette:spatialiate

COPY --from=build packages/natural_earth_vector.sqlite /natural_earth_vector.sqlite

CMD ["datasette", "serve", "/natural_earth_vector.sqlite", "--host", "0.0.0.0", "--cors"]
