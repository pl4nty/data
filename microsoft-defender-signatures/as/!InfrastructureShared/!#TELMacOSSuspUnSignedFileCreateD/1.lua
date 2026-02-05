-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspUnSignedFileCreateD\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "2b7c43bd-d536-48e1-aa22-4511aa1df07b" then
  return mp.CLEAN
end
local l_0_1 = (versioning.GetMachineGuid)()
if l_0_1 == nil or l_0_1 == "" or l_0_1:lower() ~= "1b81b449-cd71-5b09-9bb0-347f2e9f8a05" then
  return mp.CLEAN
end
local l_0_2, l_0_3 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_3 == nil or l_0_3 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = l_0_2 .. "/"
do
  if (string.find)(l_0_2, "/users/[^/]+/library/google/", 1, false) and (string.find)(l_0_3, "com.google.chromes.updaters", 1, true) then
    local l_0_4 = (mp.GetCertificateInfo)()
    if #l_0_4 < 1 or l_0_4 == nil then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end

