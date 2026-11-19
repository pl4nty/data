-- Threat: !InfrastructureShared
-- Name: b5b327731f85
-- Type: 21

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if l_0_1 == nil or l_0_2 == nil or string.find(l_0_2, "\\gameguard\\gamemon64.des", -24, true) or string.find(l_0_2, "\\gameguard\\gamemon.des", -22, true) then
  return mp.CLEAN
end
local l_0_3, l_0_4 = bm.get_process_relationships()
if l_0_4 ~= nil then
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    if l_0_6.image_path ~= nil and l_0_6.reason == bm.RELATIONSHIP_INJECTION then
      local l_0_7 = string.lower(l_0_6.image_path)
      if string.find(l_0_7, "\\gameguard\\gamemon64.des", -24, true) or string.find(l_0_7, "\\gameguard\\gamemon.des", -22, true) then
        return mp.CLEAN
      end
    end
  end
end
if l_0_3 ~= nil then
  for l_0_8, l_0_9 in ipairs(l_0_3) do
    if l_0_9.image_path ~= nil and l_0_9.reason == bm.RELATIONSHIP_INJECTION then
      l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
      if string.find(l_0_0, "\\cnext\\radeonsoftware.exe", -25, true) or string.find(l_0_0, "\\steam\\steam.exe", -16, true) or string.find(l_0_0, "\\tychon\\tychoncoreservice.exe", -29, true) or string.find(l_0_0, "\\system32\\userinit.exe", -22, true) or string.find(l_0_0, "\\vagrant\\bin\\vagrant.exe", -24, true) or string.find(l_0_0, "\\gameguard\\gamemon64.des", -24, true) or string.find(l_0_0, "\\gameguard\\gamemon.des", -22, true) then
        return mp.CLEAN
      end
    end
  end
end
if sysio.IsFileExists(l_0_0) and not mp.IsKnownFriendlyFile(l_0_0, true, false) then
  bm.add_related_file(l_0_0)
end
if sysio.IsFileExists(l_0_2) and not mp.IsKnownFriendlyFile(l_0_2, true, false) then
  return mp.INFECTED
end
return mp.CLEAN
