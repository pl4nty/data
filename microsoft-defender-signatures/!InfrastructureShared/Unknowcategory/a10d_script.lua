-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a10d_luac 

-- params : ...
-- function num : 0
do
  if peattributes.isexe then
    local l_0_0 = (mp.getfilesize)()
    if l_0_0 > 7340032 and l_0_0 < 10485760 and (pe.query_import)(pe.IMPORT_STATIC, 660922497) ~= 0 then
      if not (mp.get_mpattribute)("do_exhaustivehstr_64bit_rescan") then
        (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan")
      end
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

