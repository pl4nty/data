-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAPDFSuspiciousFileP\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or (string.len)(l_0_0) <= 5 then
  return mp.CLEAN
end
if (string.find)(l_0_0, "normal_5fa%x%x%x%x%x%x%x%x%x%x%.pdf") ~= nil or (string.find)(l_0_0, "normal_5fb%x%x%x%x%x%x%x%x%x%x%.pdf") ~= nil or (string.find)(l_0_0, "normal_5fc%x%x%x%x%x%x%x%x%x%x%.pdf") ~= nil or (string.find)(l_0_0, "normal_5fd%x%x%x%x%x%x%x%x%x%x%.pdf") ~= nil or (string.find)(l_0_0, "normal_5fe%x%x%x%x%x%x%x%x%x%x%.pdf") ~= nil or (string.find)(l_0_0, "normal_5ff%x%x%x%x%x%x%x%x%x%x%.pdf") ~= nil or (string.find)(l_0_0, "scan_34%d%d+_inv%.pdf") ~= nil or (string.find)(l_0_0, "document_%d%d%d_unpaid_%-1%-12.pdf") ~= nil or (string.find)(l_0_0, "complaintapril_%d%d%d%d+%.pdf") ~= nil or (string.find)(l_0_0, "inv%(05%-10%)copy#%d+%.pdf") ~= nil or (string.find)(l_0_0, "claim%-11%-2%-%d%d%d%a%a%a%d%d%d%.pdf") ~= nil or (string.find)(l_0_0, "claim%-nov%-2%-%d%d%d%a%a%a%d%d%d%.pdf") ~= nil or (string.find)(l_0_0, "claim%-november%-2%-%d%d%d%a%a%a%d%d%d%.pdf") ~= nil or (string.find)(l_0_0, "claim%-11%-2%-%d%d%d%a%a%a%d%d%d%-23%.pdf") ~= nil or (string.find)(l_0_0, "claim%-nov%-2%-%d%d%d%a%a%a%d%d%d%-23%.pdf") ~= nil or (string.find)(l_0_0, "claim%-november%-2%-%d%d%d%a%a%a%d%d%d%-23%.pdf") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

