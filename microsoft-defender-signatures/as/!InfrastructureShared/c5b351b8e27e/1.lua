-- Threat: !InfrastructureShared
-- Name: c5b351b8e27e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
if not this_sigattrlog[5].matched then
  return mp.CLEAN
end
local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1 = {
  "\\msbuild.exe",
  "\\devenv.exe",
  "\\dotnet.exe",
  "\\visual studio\\"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_3, 1, true) then
    return mp.CLEAN
  end
end
bm.add_related_string("cad_exec_proc", l_0_0, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1127.001", "SuspCompiledPayloadExec")
return mp.INFECTED
