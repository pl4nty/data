-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\220b30275fa2f\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or (this_sigattrlog[1]).utf8p2 == nil then
  return mp.CLEAN
end
if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p2)
do
  if not (string.find)(l_0_0, "/format:", 1, true) then
    local l_0_1 = (string.find)(l_0_0, "/format :", 1, true)
  end
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = nil
  if isnull((bm.get_imagepath)()) then
    return mp.CLEAN
  end
  if (string.find)((string.lower)((bm.get_imagepath)()), "\\windows defender\\msmpeng.exe", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = nil
  for l_0_7,l_0_8 in ipairs({"/format:csv", "/format:list", "/format:table", "/format:value", "/format:rawxml", "/format:htable", "/format:hform", "/format:textvaluelist"}) do
    local l_0_4 = nil
    -- DECOMPILER ERROR at PC93: Confused about usage of register: R8 in 'UnsetPending'

    if (string.find)(l_0_0, "/format:rawxml", 1, true) then
      return mp.CLEAN
    end
  end
  ;
  (bm.add_related_string)("xsl_wmic_cmd", l_0_0, bm.RelatedStringBMReport)
  if (this_sigattrlog[2]).utf8p1 then
    (bm.add_related_string)("xsl_child", (this_sigattrlog[2]).utf8p1, bm.RelatedStringBMReport)
  end
  add_parents()
  TrackPidAndTechniqueBM("BM", "T1220", "SuspWmicXslExec")
  return mp.INFECTED
end

