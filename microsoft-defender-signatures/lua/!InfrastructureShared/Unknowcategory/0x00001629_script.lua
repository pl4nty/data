-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00001629_luac 

-- params : ...
-- function num : 0
do
  if peattributes.isdll and not peattributes.no_exports then
    local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
    if l_0_0 == "scrobj.dll" then
      (mp.set_mpattribute)("Lua:Context:Filename_scrobj_dll")
    end
  end
  return mp.CLEAN
end

