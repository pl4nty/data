-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x0000bbd6_luac 

-- params : ...
-- function num : 0
do
  if peattributes.isdll then
    local l_0_0 = (mp.getfilesize)()
    if l_0_0 > 5447680 and l_0_0 < 7290880 and (pe.query_import)(pe.IMPORT_STATIC, 3164448353) ~= 0 and (pe.query_import)(pe.IMPORT_STATIC, 2744197095) ~= 0 and (pe.query_import)(pe.IMPORT_STATIC, 2717511079) ~= 0 and (pe.query_import)(pe.IMPORT_STATIC, 537135066) ~= 0 and (pe.query_import)(pe.IMPORT_STATIC, 3293213921) ~= 0 then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

