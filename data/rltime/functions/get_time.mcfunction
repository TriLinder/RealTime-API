forceload add 123 123

gamerule sendCommandFeedback true

scoreboard objectives add rlTime dummy "Server Time"

setblock 123 1 123 air
#setblock 123 0 123 air

execute if score $nonVanilla rlTime matches 0 run setblock 123 0 123 minecraft:command_block{Command:"/help help"}
execute if score $nonVanilla rlTime matches 1 run setblock 123 0 123 minecraft:command_block{Command:"/minecraft:help help"}

setblock 123 1 123 redstone_block

kill @e[tag=rltime]
summon armor_stand 123 0 123 {Tags:["rltime"],Invisible:1b,Marker:1b}

execute as @e[tag=rltime,limit=1] at @s run data modify entity @s HandItems[0].tag.Time set from block 123 0 123 LastOutput

execute as @e[tag=rltime,limit=1] at @s run loot replace entity @s weapon.offhand loot rltime:get_time

execute as @e[tag=rltime,limit=1] at @s run execute store result score $h rlTime run data get entity @s HandItems[1].tag.Time[0]
execute as @e[tag=rltime,limit=1] at @s run execute store result score $m rlTime run data get entity @s HandItems[1].tag.Time[1]
execute as @e[tag=rltime,limit=1] at @s run execute store result score $s rlTime run data get entity @s HandItems[1].tag.Time[2]

scoreboard players set 60 rlTime 60

scoreboard players operation $m-seconds rlTime = $m rlTime
scoreboard players operation $m-seconds rlTime *= 60 rlTime

scoreboard players operation $h-seconds rlTime = $h rlTime
scoreboard players operation $h-seconds rlTime *= 60 rlTime
scoreboard players operation $h-seconds rlTime *= 60 rlTime

scoreboard players operation $in-seconds rlTime = $s rlTime
scoreboard players operation $in-seconds rlTime += $m-seconds rlTime
scoreboard players operation $in-seconds rlTime += $h-seconds rlTime

execute if score $h rlTime matches 0 if score $m rlTime matches 0 if score $s rlTime matches 0 run scoreboard players add $secondsOn0 rlTime 1
execute unless score $h rlTime matches 0 unless score $m rlTime matches 0 unless score $s rlTime matches 0 run scoreboard players set $secondsOn0 rlTime 0

execute if score $secondsOn0 rlTime matches 5.. run scoreboard players add $nonVanilla rlTime 1
execute if score $secondsOn0 rlTime matches 5.. run setblock 123 0 123 air
execute if score $secondsOn0 rlTime matches 5.. run scoreboard players set $secondsOn0 rlTime 0

execute if score $nonVanilla rlTime matches 2.. run scoreboard players set $nonVanilla rlTime 0

setblock 123 1 123 air