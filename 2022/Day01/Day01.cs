using System.Collections.Generic;
using System.Linq;

namespace AdventOfCode2022
{
    class Day01
    {
        public void Solve(){
            List<int> cals = new List<int>();
            string[] input = File.ReadAllText("Day01/input").Split("\n\n");
            foreach ( string elf in input){
                cals.Add( elf.Split("\n").Sum(int.Parse));
            }
            //Part1
            Console.WriteLine(cals.Max());
            //Part2
            Console.WriteLine(cals.OrderByDescending(p => p).ToList().Take(3).Sum());
         }

    }
}
