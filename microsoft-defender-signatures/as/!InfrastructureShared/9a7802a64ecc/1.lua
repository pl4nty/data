-- Threat: !InfrastructureShared
-- Name: 9a7802a64ecc
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 4 then
  mp.changedetectionname(805306411)
  return mp.INFECTED
end
return mp.SUSPICIOUS
