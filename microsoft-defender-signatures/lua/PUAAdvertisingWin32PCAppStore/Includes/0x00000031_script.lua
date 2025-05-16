-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\PUAAdvertisingWin32PCAppStore\Includes\0x00000031_luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_versioninfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ProductName
if l_0_1 then
  l_0_1 = (string.lower)(l_0_1)
  if (string.find)(l_0_1, "appstore", 1, true) or (string.find)(l_0_1, "app store", 1, true) or (string.find)(l_0_1, "application store", 1, true) or (string.find)(l_0_1, "pc app", 1, true) or (string.find)(l_0_1, "?pp store", 1, true) then
    local l_0_2 = l_0_0.ProductVersion
    local l_0_3 = l_0_2:match("([0-9.]+)")
    if compareProductVersion(l_0_3, "1.0.0.1091") == -1 then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

