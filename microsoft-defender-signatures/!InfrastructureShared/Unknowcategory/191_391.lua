-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\191_391.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p1)
    if (sysio.GetFileSize)(l_0_0) > 300000000 and (string.match)(l_0_0, ".:\\[^\\]+.exe$") then
      return mp.INFECTED
    else
      return mp.CLEAN
    end
  end
  return mp.CLEAN
end

