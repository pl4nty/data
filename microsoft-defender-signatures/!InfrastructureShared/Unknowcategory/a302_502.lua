-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a302_502.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_3 = (string.match)(l_0_0, "(.*)%.(%a+)->%w+/%w+.bin$")
if l_0_3 == nil or l_0_0 == nil then
  l_0_3 = l_0_0
  local l_0_1, l_0_2 = nil
else
  do
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R2 in 'UnsetPending'

    l_0_3 = l_0_3 .. "." .. l_0_1
    l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
    if l_0_3 == nil or l_0_3 == "" then
      return mp.CLEAN
    end
    l_0_3 = (string.lower)(l_0_3)
    if (string.find)(l_0_3, ".:\\program files %(x86%)\\blp\\api\\office tools\\") ~= nil then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end

