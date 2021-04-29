tellraw @a ["",{"text":"Real Time ","bold":true,"color":"green"},{"text":"by TriLinder has been loaded.","color":"aqua"}]

scoreboard objectives add rlTime dummy "Server Time"
execute unless score $syncTime rlTime matches 0..1 run scoreboard players set $syncTime rlTime 0


function rltime:one_second

fill 125 3 125 121 0 121 minecraft:bedrock