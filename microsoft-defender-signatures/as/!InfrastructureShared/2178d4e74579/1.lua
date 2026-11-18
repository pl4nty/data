-- Threat: !InfrastructureShared
-- Name: 2178d4e74579
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources and hstrlog[2].hitcount > 300 then
  return mp.INFECTED
end
return mp.CLEAN
