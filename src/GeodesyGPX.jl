module GeodesyGPX

import Geodesy
import GPX

"""
    LatLon(point::GPXPoint)

Latitude and longitude co-ordinates, constructed from a GPX point. Elevation is simply ignored.
"""
Geodesy.LatLon(point::GPX.GPXPoint) = Geodesy.LatLon(point.lat, point.lon)

"""
    LLA(point::GPXPoint)

Latitude, longitude, and altitude co-ordinates, constructed from a GPX point.
"""
Geodesy.LLA(point::GPX.GPXPoint) = Geodesy.LLA(point.lat, point.lon, point.ele)

"""
	ECEF(point::GPXPoint, [datum = wgs84])

Earth-Centered-Earth-Fixed (ECEF) coordinates, constructed from a GPX point.
"""
Geodesy.ECEF(point::GPX.GPXPoint, datum=wgs84) = Geodesy.ECEF(Geodesy.LLA(point), datum)


"""
    euclidean_distance(a::GPXPoint, b::GPXPoint, [datum = wgs84])

The straight-line distance between GPX points `a` and `b`.
"""
Geodesy.euclidean_distance(a::GPX.GPXPoint, b::GPX.GPXPoint, datum=wgs84) = Geodesy.euclidean_distance(Geodesy.ECEF.((a, b))..., datum)
end
