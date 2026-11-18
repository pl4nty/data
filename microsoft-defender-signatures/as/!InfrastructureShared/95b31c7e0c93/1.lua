-- Threat: !InfrastructureShared
-- Name: 95b31c7e0c93
-- Type: 21

local l_0_0, l_0_1
local l_0_2 = bm.get_current_process_startup_info()
local l_0_3 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if l_0_2 == nil or l_0_3 == nil or string.find(l_0_3, "\\gameguard\\gamemon64.des", -24, true) or string.find(l_0_3, "\\gameguard\\gamemon.des", -22, true) then
  return mp.CLEAN
end
local l_0_4, l_0_5 = bm.get_process_relationships()
if l_0_5 ~= nil then
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    if l_0_7.image_path ~= nil and l_0_7.reason == bm.RELATIONSHIP_INJECTION then
      local l_0_8 = string.lower(l_0_7.image_path)
      if string.find(l_0_8, "\\gameguard\\gamemon64.des", -24, true) or string.find(l_0_8, "\\system32\\mrt.exe", -17, true) or string.find(l_0_8, "\\asep_inv.exe", -13, true) or string.find(l_0_8, "\\mpsigstub.exe", -14, true) or string.find(l_0_8, "\\gameguard\\gamemon.des", -22, true) then
        return mp.CLEAN
      end
      l_0_1 = l_0_7.ppid
    end
  end
end
if l_0_4 ~= nil then
  for l_0_9, l_0_10 in ipairs(l_0_4) do
    if l_0_10.image_path ~= nil then
      l_0_0 = string.lower(MpCommon.PathToWin32Path(l_0_10.image_path))
      if string.find(l_0_0, "\\mcafee\\systemcore\\mfehcs.exe", -29, true) or string.find(l_0_0, "(x86)\\pharossystems\\printscout\\ctskmstr.exe", -43, true) or string.find(l_0_0, "(x86)\\hp\\printscout\\ctskmstr.exe", -32, true) or string.find(l_0_0, "\\mcafee\\endpoint security\\threat prevention\\mfetp.exe", -53, true) or string.find(l_0_0, "\\anti-malware\\mbamservice.exe", -29, true) or string.find(l_0_0, "\\cnext\\radeonsoftware.exe", -25, true) or string.find(l_0_0, "(x86)\\panda security\\wac\\psanhost.exe", -37, true) or string.find(l_0_0, "(x86)\\cloudvolumes\\agent\\svservice.exe", -38, true) or string.find(l_0_0, "\\gameguard\\gamemon64.des", -24, true) or string.find(l_0_0, "\\gameguard\\gamemon.des", -22, true) or string.find(l_0_0, "(x86)\\f-secure\\server security\\", 1, true) then
        return mp.CLEAN
      end
    end
  end
end
if sysio.IsFileExists(l_0_0) and not mp.IsKnownFriendlyFile(l_0_0, true, false) then
  bm.add_related_file(l_0_0)
end
if sysio.IsFileExists(l_0_3) and not mp.IsKnownFriendlyFile(l_0_3, true, false) and l_0_1 ~= nil then
  bm.request_SMS(l_0_1, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
  bm.add_related_file(l_0_3)
  return mp.INFECTED
end
return mp.CLEAN
