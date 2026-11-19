-- Threat: \xadABeaverTail.D!dha
-- Type: 13
-- MpAttributes: Lua:JSExt

if #mp.enum_mpattributesubstring("SCPT:BeaverTail.AA") >= 6 then
  return mp.INFECTED
end
return mp.CLEAN
