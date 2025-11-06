-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFMacOSSuspUnSignedFileCreateB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "19973957-59ce-41e6-b56b-815adf4e993a" and l_0_0:lower() ~= "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" and l_0_0:lower() ~= "eae651fb-6b33-43bf-9f1b-5db8005d08c8" and l_0_0:lower() ~= "cbbbdbab-3a64-4985-8c50-73f760c0c1e8" and l_0_0:lower() ~= "a969413e-4834-4ade-8fac-e72c8644bad5" and l_0_0:lower() ~= "bc8263de-5f1d-4e3d-aa94-c57c016921e9" and l_0_0:lower() ~= "e7b4b5b5-cc27-4121-aabc-5efec589973d" and l_0_0:lower() ~= "9ff3ad62-771c-4e90-b459-128e2785ef42" and l_0_0:lower() ~= "dde274ce-9e7c-4295-ba15-509d02bd42cd" and l_0_0:lower() ~= "f7f68d47-e8c5-4553-a51e-dec472f31bfd" and l_0_0:lower() ~= "4ec5f50d-2073-4ecf-986c-0dcca43f933a" then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
l_0_1 = l_0_1 .. "/"
do
  if ((string.find)(l_0_1, "/tmp/", 1, true) or (string.find)(l_0_1, "/users/[^/]+/downloads/", 1, false) or (string.find)(l_0_1, "/users/[^/]+/desktop/", 1, false)) and ((string.find)(l_0_2, "slack", 1, true) or (string.find)(l_0_2, "videocapture", 1, true) or (string.find)(l_0_2, "reverseshell", 1, true) or (string.find)(l_0_2, "reverse_shell", 1, true)) then
    local l_0_3 = (mp.GetCertificateInfo)()
    if #l_0_3 < 1 or l_0_3 == nil then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end

