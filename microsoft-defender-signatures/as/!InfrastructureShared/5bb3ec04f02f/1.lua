-- Threat: !InfrastructureShared
-- Name: 5bb3ec04f02f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[1].matched and not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = {
  "\\systemsettings.exe",
  "\\windowsterminal.exe",
  "\\wt.exe",
  "\\openconsole.exe"
}
if contains(l_0_0, l_0_1, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1546.015", "COMHijacking")
return mp.INFECTED
