-- Threat: !InfrastructureShared
-- Name: a56144e36a28
-- Type: 21

if mp.getfilename():match("/embeddings/oleObject") then
  mp.changedetectionname(805306516)
  return mp.INFECTED
end
return mp.INFECTED
