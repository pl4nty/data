-- Threat: !InfrastructureShared
-- Name: de8de4a702e5
-- Type: 21

local l_0_0 = macho.GetSegment("LC_SYMTAB", 0, 21)
if machoLC.__TEXT.__cstring.Size <= 1535 and machoLC.__TEXT.__text.Size <= 767 and string.byte(l_0_0, 13) == 14 and string.byte(l_0_0, 21) == 240 then
  local l_0_1 = mp.getfilesize()
  if l_0_1 < 10000 and machohdr.FileType == 6 and machohdr.NumberOfCommands <= 15 then
    return mp.INFECTED
  end
end
return mp.CLEAN
