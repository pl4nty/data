-- Threat: !InfrastructureShared
-- Name: 1c78795fec9e
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
