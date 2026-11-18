-- Threat: !InfrastructureShared
-- Name: af786921af51
-- Type: 21

if peattributes.x86_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
