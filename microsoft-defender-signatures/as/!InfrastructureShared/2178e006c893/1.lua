-- Threat: !InfrastructureShared
-- Name: 2178e006c893
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
