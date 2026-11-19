-- Threat: !InfrastructureShared
-- Name: 1acb3d6cf4de3
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  l_0_1 = "vbc.exe"
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  l_0_1 = "csc.exe"
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_2 = false
if l_0_1 == "vbc.exe" then
  l_0_2 = string.find(l_0_0, ".vb", 1, true)
elseif l_0_1 == "csc.exe" then
  l_0_2 = string.find(l_0_0, ".cs", 1, true)
end
if not l_0_2 then
  return mp.CLEAN
end
if not this_sigattrlog[5].matched and not this_sigattrlog[7].matched then
  return mp.CLEAN
end
local l_0_3 = {
  "\\msbuild.exe",
  "\\devenv.exe",
  "\\dotnet.exe",
  "\\visual studio\\",
  "\\jetbrains\\",
  "\\rider\\",
  "\\nuget.exe",
  "\\omnisharp",
  "\\roslyn\\",
  "\\microsoft.net\\framework",
  "\\servicehub"
}
local l_0_4 = bm.get_current_process_startup_info()
if l_0_4 and l_0_4.image_path then
  local l_0_5 = string.lower(l_0_4.image_path)
  for l_0_6, l_0_7 in ipairs(l_0_3) do
    if string.find(l_0_5, l_0_7, 1, true) then
      return mp.CLEAN
    end
  end
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  local l_0_8 = string.lower(this_sigattrlog[5].utf8p1)
  local l_0_9 = {
    "\\users\\",
    "\\temp\\",
    "\\tmp\\",
    "\\downloads\\",
    "\\desktop\\",
    "\\appdata\\",
    "\\public\\",
    "\\windows\\temp\\"
  }
  local l_0_10 = false
  for l_0_11, l_0_12 in ipairs(l_0_9) do
    if string.find(l_0_8, l_0_12, 1, true) then
      l_0_10 = true
      break
    end
  end
  if not l_0_10 then
    return mp.CLEAN
  end
  bm.add_related_string("cad_output", l_0_8, bm.RelatedStringBMReport)
end
bm.add_related_string("cad_compiler", l_0_1, bm.RelatedStringBMReport)
bm.add_related_string("cad_cmdline", l_0_0, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1127.001", "SuspCompileAfterDelivery.B")
return mp.INFECTED
