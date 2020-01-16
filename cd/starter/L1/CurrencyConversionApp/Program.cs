﻿using System;

namespace CurrencyConversionApp
{
    class Program
    {
        static float Input()
        {
            float num;
            while (!float.TryParse(Console.ReadLine(), out num))
            {
                Console.WriteLine("Error!Enter number");
            }
            return num;
        }

        static void Converter(float amounth, float exchangeRate)
        {
            Console.WriteLine(amounth * exchangeRate);
        }

        static void Main(string[] args)
        {
            float amount, exchangeRate;
            Console.WriteLine("Enter the amount of money you need to transfer: ");
            amount = Input();
            Console.WriteLine("Enter exchange rate: ");
            exchangeRate = Input();
            Converter(amount , exchangeRate);
            Console.ReadKey();
        }
    }
}
