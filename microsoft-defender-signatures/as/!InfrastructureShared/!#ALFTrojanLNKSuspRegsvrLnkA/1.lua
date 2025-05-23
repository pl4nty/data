-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanLNKSuspRegsvrLnkA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0 == nil or (string.find)(l_0_0:lower(), "\\start menu\\programs\\startup\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
do
  if l_0_1 ~= nil then
    local l_0_2 = l_0_1:lower()
    if (string.find)(l_0_2, "^flx%x%x%x%x?%.lnk$") ~= nil or (string.find)(l_0_2, "^flx%x%x%x%x?%.tmp$") ~= nil or (string.find)(l_0_2, "^@?%x%x%x%x%x%x%x%x%x%x%x%x%.lnk$") ~= nil or l_0_2 == "zlighthouseregisterieplugin.lnk" or l_0_2 == "microsoft-teamsaddin.lnk" then
      return mp.CLEAN
    end
  end
  local l_0_3 = (mp.GetLnkInfo)()
  do
    if l_0_3 ~= nil and l_0_3.BasePath ~= nil and (string.find)((l_0_3.BasePath):lower(), "\\regsvr32.exe", 1, true) ~= nil and l_0_3.Arguments ~= nil then
      local l_0_4 = (l_0_3.Arguments):lower()
      if (string.find)(l_0_4, ".cpp", 1, true) == nil and (string.find)(l_0_4, ".ocx", 1, true) == nil and (string.find)(l_0_4, "redemption.dll", 1, true) == nil then
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end

