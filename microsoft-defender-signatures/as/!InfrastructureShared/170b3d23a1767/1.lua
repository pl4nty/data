-- Threat: !InfrastructureShared
-- Name: 170b3d23a1767
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
if not this_sigattrlog[5].matched or this_sigattrlog[5].utf8p1 == nil then
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
  "\\visual studio\\",
  "\\jetbrains\\",
  "\\rider\\",
  "\\nuget.exe",
  "\\omnisharp",
  "\\roslyn\\",
  "\\microsoft.net\\framework"
}
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 and l_0_2.image_path then
  local l_0_3 = string.lower(l_0_2.image_path)
  for l_0_4, l_0_5 in ipairs(l_0_1) do
    if string.find(l_0_3, l_0_5, 1, true) then
      return mp.CLEAN
    end
  end
end
local l_0_6 = string.lower(this_sigattrlog[5].utf8p1)
local l_0_7 = {
  "\\users\\",
  "\\temp\\",
  "\\tmp\\",
  "\\downloads\\",
  "\\desktop\\",
  "\\appdata\\",
  "\\public\\"
}
local l_0_8 = false
for l_0_9, l_0_10 in ipairs(l_0_7) do
  if string.find(l_0_6, l_0_10, 1, true) then
    l_0_8 = true
    break
  end
end
if not l_0_8 then
  return mp.CLEAN
end
bm.add_related_string("cad_compiler", l_0_0, bm.RelatedStringBMReport)
bm.add_related_string("cad_output", l_0_6, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1127.001", "SuspCompileAfterDelivery")
return mp.INFECTED
