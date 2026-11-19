-- Threat: !InfrastructureShared
-- Name: 27cb3d783bcba
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if l_0_0 == nil or string.find(l_0_0, "\\hummingheads\\securityplatform\\bktask.exe", -41, true) or string.find(l_0_0, "\\hummingheads\\securityplatform\\bkhost.exe", -41, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_2 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if l_0_4.image_path ~= nil and l_0_4.reason == bm.RELATIONSHIP_INJECTION then
      local l_0_5 = string.lower(l_0_4.image_path)
      if string.find(l_0_5, "\\powershell.exe", -15, true) then
        TrackPidAndTechniqueBM("BM", "T1055.002", "portable_executable_injection")
        return mp.INFECTED
      end
    end
  end
end
if l_0_1 ~= nil then
  for l_0_6, l_0_7 in ipairs(l_0_1) do
    if l_0_7.image_path ~= nil and l_0_7.reason == bm.RELATIONSHIP_INJECTION then
      local l_0_8 = string.lower(l_0_7.image_path)
      if string.find(l_0_8, "\\powershell.exe", -15, true) then
        TrackPidAndTechniqueBM("BM", "T1055.002", "portable_executable_injection")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
