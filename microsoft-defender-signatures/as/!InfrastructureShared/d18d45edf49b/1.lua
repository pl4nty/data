-- Threat: !InfrastructureShared
-- Name: d18d45edf49b
-- Type: 21

local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename(mp.FILEPATH_QUERY_FULL)):lower()
if l_0_0:find("magnifier", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("cameramessagesapp", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("barcodescanner", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("mobilesms", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("springboard", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("camera", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("filza", 1, true) then
  return mp.CLEAN
end
if l_0_0:find(".deb", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
