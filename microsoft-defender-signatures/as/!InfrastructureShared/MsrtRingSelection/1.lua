-- Threat: !InfrastructureShared
-- Name: MsrtRingSelection
-- Type: 23

if versioning.GetSafeReleaseRing() == 200 then
  database.LoadDBVar(database.DBVAR_DW, "MpMsrtRing", 1, 1)
  database.AddStudyId("LUA-MSRT-INTERNAL")
  return
end
local l_0_0 = versioning.GetOfficeConfigRing()
if l_0_0 == 0 or l_0_0 == 1 or l_0_0 == 5 or versioning.IsMSFT() then
  database.LoadDBVar(database.DBVAR_DW, "MpMsrtRing", 2, 1)
  database.AddStudyId("LUA-MSRT-MSFT")
  return
end
if versioning.IsWindowsInsider() then
  database.LoadDBVar(database.DBVAR_DW, "MpMsrtRing", 3, 1)
  database.AddStudyId("LUA-MSRT-INSIDER")
  return
end
database.AddStudyId("LUA-MSRT-BROAD")
