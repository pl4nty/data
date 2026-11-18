-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/CheeseMap.F!dha
-- Type: 13
-- MpAttributes: SCPT:CheeseMap.F1 & BM_UNKNOWN_FILE

if mp.readu_u16(headerpage, 1) == 10558 then
  mp.readprotection(false)
  local l_0_0 = mp.readfile(78, 38)
  local l_0_1 = "1\015\b\022R\023\001\028\003\020\018\005G\a\a\023\026\n\021R\022\002E\000\001\006G\027\vG%*!G\030\028\000\003"
  if l_0_0 == l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
