-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000eb1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
local l_0_1 = l_0_0.ppid
if l_0_0 == nil then
  return mp.CLEAN
end
do
  if l_0_0.image_path ~= nil then
    local l_0_2 = (string.lower)(l_0_0.image_path)
    if (string.find)(l_0_2, "\\teamcity\\", 1, true) and (string.sub)(l_0_2, -8) == "java.exe" then
      return mp.INFECTED
    end
  end
  if l_0_1 then
    local l_0_3 = (mp.GetParentProcInfo)(l_0_1)
    if l_0_3 == nil then
      return mp.CLEAN
    end
    if l_0_3.image_path ~= nil then
      local l_0_4 = (string.lower)(l_0_3.image_path)
      if (string.find)(l_0_4, "\\teamcity\\", 1, true) and (string.sub)(l_0_4, -8) == "java.exe" then
        return mp.INFECTED
      end
    end
  end
  do
    return mp.CLEAN
  end
end

