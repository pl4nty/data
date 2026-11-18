-- Threat: !InfrastructureShared
-- Name: !#LUA:MSISuspiciousSName
-- Type: 13
-- MpAttributes: (BM_MZ_DLL | BM_UNKNOWN_FILE | HSTR:NSIS_Installer)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if mp.getfilesize() < 1024000 and mp.getfilesize() > 300000 then
  return mp.CLEAN
end
if string.find(l_0_0, "binary%.duim%.dll") or string.find(l_0_0, "binary%.fa1a%.dll") or string.find(l_0_0, "binary%.fibu%.dll") or string.find(l_0_0, "binary%.fordmodal%.dll") or string.find(l_0_0, "binary%.krebim%.dll") or string.find(l_0_0, "binary%.mirinha%.dll") or string.find(l_0_0, "binary%.mitrati%.dll") or string.find(l_0_0, "binary%.motel%.dll") or string.find(l_0_0, "binary%.nbaaas1%.dll") or string.find(l_0_0, "binary%.prinovi%.dll") or string.find(l_0_0, "binary%.rxda%.dll") or string.find(l_0_0, "binary%.scret%.dll") or string.find(l_0_0, "binary%.solar%.dll") or string.find(l_0_0, "binary%.sombrao%.dll") or string.find(l_0_0, "binary%.tddddd%.dll") or string.find(l_0_0, "binary%.tib%.dll") or string.find(l_0_0, "binary%.aldi%d%.dll") or string.find(l_0_0, "binary%.balls1%.dll") or string.find(l_0_0, "binary%.bidulim%.dll") or string.find(l_0_0, "binary%.bilue%.dll") or string.find(l_0_0, "binary%.c%ddotim%.dll") or string.find(l_0_0, "binary%.c%ddotilibim%.dll") or string.find(l_0_0, "binary%.c%ddolim%.dll") or string.find(l_0_0, "binary%.daown%.dll") or string.find(l_0_0, "%.pdf____+%.exe$") or string.find(l_0_0, "invoice 0%d%d%.exe$") or string.find(l_0_0, "..exe", 1, true) ~= nil or string.find(l_0_0, ".pdf.exe", 1, true) ~= nil or string.find(l_0_0, "t7416.exe", 1, true) ~= nil or string.find(l_0_0, ".xls.exe", 1, true) ~= nil or string.find(l_0_0, "________pdf.exe", 1, true) ~= nil or string.find(l_0_0, "bnn.exe", 1, true) ~= nil or string.find(l_0_0, "%.%.bat$") or string.find(l_0_0, "payment advice.rar", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
