-- Threat: !InfrastructureShared
-- Name: !#SLF:TriggerCloudForFriendlyScans
-- Type: 10

if not mp.istriggercloudyfriendlyscan() then
  return mp.CLEAN
end
local l_0_0 = mp.get_parent_filehandle()
if not mp.is_handle_nil(l_0_0) then
  return mp.CLEAN
end
if not mp.isfriendlyscan() then
  return mp.CLEAN
end
if peattributes.msil_ngenimage then
  return mp.CLEAN
end
return mp.INFECTED
