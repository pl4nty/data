-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00001135_luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p1)
    if (string.byte)(l_0_0) == (string.byte)("%") then
      if (string.match)(l_0_0, "%%localappdata%%\\[^\\]+\\") == nil then
        return mp.INFECTED
      else
        if (string.match)(l_0_0, "%%localappdata%%\\[^\\]+\\$") ~= nil then
          return mp.INFECTED
        else
          return mp.CLEAN
        end
      end
    else
      if (string.match)(l_0_0, "\\local\\[^\\]+\\") == nil then
        return mp.INFECTED
      else
        if (string.match)(l_0_0, "\\local\\[^\\]+\\$") ~= nil then
          return mp.INFECTED
        else
          return mp.CLEAN
        end
      end
    end
  end
  return mp.CLEAN
end

