-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\87cb_313.luac 

-- params : ...
-- function num : 0
do
  if peattributes.isdll and peattributes.hasexports then
    local l_0_0 = (mp.getfilesize)()
    if l_0_0 > 409600 and l_0_0 < 716800 and (pe.get_exports_count)() == 9 then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

