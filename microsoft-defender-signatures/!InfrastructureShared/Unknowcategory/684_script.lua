-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\684_luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
    local l_0_0 = (string.lower)((this_sigattrlog[3]).utf8p1)
    if not (string.find)(l_0_0, "c:\\program files", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

