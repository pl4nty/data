-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32AppDomainManagerTypeA\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if (string.sub)(l_0_0, -11) ~= ".exe.config" or (string.find)(l_0_0, "program files", 1, true) ~= nil then
  return mp.CLEAN
end
do
  if (mp.getfilesize)() > 10000 then
    local l_0_1, l_0_2, l_0_3 = 10000
  end
  ;
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_4 = nil
  ;
  (mp.readprotection)(true)
  local l_0_5 = nil
  local l_0_6 = (tostring((mp.readfile)(0, l_0_1))):match("<appDomainManagerAssembly value=\"([^\"\r\n\\,]+)")
  local l_0_7 = (l_0_5:match("<probing privatePath=\"([^\"\r\n]+)"))
  do
    if ((string.sub)(l_0_6, -4) ~= ".dll" and not l_0_7) or l_0_7 == "" then
      local l_0_8 = nil
      l_0_8 = l_0_0:match("^(.*)[/\\][^/\\]+$") .. "\\" .. l_0_6
    else
    end
    -- DECOMPILER ERROR at PC100: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC109: Confused about usage of register: R5 in 'UnsetPending'

    if (string.sub)(l_0_7, -1) ~= "\\" or (sysio.IsFileExists)(l_0_7 .. l_0_6) then
      (mp.ReportLowfi)(l_0_7 .. l_0_6, 1924697406)
    end
    return mp.INFECTED
  end
end

