-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspUnSignedFileCreateD\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE or l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = l_0_1 .. "/"
do
  if (string.find)(l_0_1, "/users/[^/]+/library/google/", 1, false) and (string.find)(l_0_2, "com.google.chromes.updaters", 1, true) then
    local l_0_3 = (mp.GetCertificateInfo)()
    if #l_0_3 < 1 or l_0_3 == nil then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end

