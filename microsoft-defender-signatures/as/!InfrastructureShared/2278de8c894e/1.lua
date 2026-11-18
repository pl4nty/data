-- Threat: !InfrastructureShared
-- Name: 2278de8c894e
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
