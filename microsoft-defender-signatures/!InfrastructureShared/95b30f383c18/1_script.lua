-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\95b30f383c18\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
    local l_0_0, l_0_1 = nil
  end
  local l_0_2 = nil
  if isnull(l_0_2) then
    return mp.CLEAN
  end
  l_0_2 = (string.lower)(l_0_2)
  if ({[".gz.en"] = true, [".u3enc"] = true, [".p7s"] = true, [".pgtmp"] = true, ["._temp"] = true, ["._tmp"] = true, ["._httpdltemp"] = true, ["._save"] = true, [".pbak"] = true, [".nexupdate"] = true, [".rtk"] = true, [".uwu"] = true, ["._rb"] = true, [".manadownload"] = true, [".part2"] = true, [".~tmp"] = true, [".xybak"] = true, [".lddec"] = true, [".xtemp"] = true, [".49b7.d"] = true, [".su_temp "] = true, [".mohidden"] = true, [".del"] = true, [".async"] = true, [".0-uncompress"] = true, [".inprocess"] = true, [".toberead"] = true, ["._01_"] = true, [".~_0000"] = true, [".d3d"] = true, [".pendingoverwrite"] = true, [".loading"] = true, [".batched"] = true, [".trans"] = true, [".work"] = true, [".temp"] = true, [".in_progress"] = true, [".ict"] = true, [".mectmp"] = true, [".old"] = true, [".tmp"] = true, [".ldtmp"] = true, [".org"] = true, [".upload"] = true, ["._"] = true, ["._1"] = true, [".81814"] = true, [".wip"] = true, ["._vg_abr"] = true, [".processing"] = true, [".mlock"] = true, [".mlock2"] = true, [".ready"] = true, [".importing"] = true, [".import"] = true, [".0.del"] = true, [".$o$"] = true, [".ignore"] = true, [".deleteme"] = true, [".reading"] = true, [".%-del1"] = true, [".$rm"] = true, [".iotr"] = true, [".original"] = true, [".done"] = true, ["._processing"] = true, [".sf-rename"] = true, [".found"] = true, ["._deleted"] = true, [".$$$"] = true, [".0.1"] = true, [".0"] = true, [".1"] = true, [".completed"] = true, ["._original"] = true, [".zip"] = true, [".txt"] = true, [".~"] = true, [".err"] = true, [".imp"] = true, ["._proc"] = true, [".bak"] = true, [".pdf"] = true, [".igbak"] = true, [".read"] = true, [".move"] = true, [".fsf_tmp"] = true, [".bts-wip"] = true, [".ok"] = true, [".fsa_tmp"] = true, [".nstemp"] = true, [".sv$"] = true, [".$syncovery"] = true})[l_0_2] then
    return mp.CLEAN
  end
  if not StringStartsWith(l_0_2, ".") then
    return mp.CLEAN
  end
  if (mp.GetExtensionClass)(l_0_2) ~= 0 then
    return mp.CLEAN
  end
  if (string.len)(l_0_2) <= 4 or IsExtensionDatePattern(l_0_2) == true or (string.match)(l_0_2, "%d+.%d+.%d+") then
    return mp.CLEAN
  end
  ;
  (bm.add_related_string)("ransom_ext", l_0_2, bm.RelatedStringBMReport)
  return mp.INFECTED
end

