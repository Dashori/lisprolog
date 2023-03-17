#include <iostream>
#include <vector>

using namespace std;

vector<int> mainResult;

int dop(int n, vector<int> &holes, int i);

// Вот он (по номерам лунок, откуда нужно делать каждый следующий ход): 3-4-2-3-4-1-4-2-3-4-Х.
int isWin(int n, vector<int> holes)
{
    for (int i = 0; i < n - 1; i++)
    {
        if (holes[i] != 0)
            return 0;
    }

    return 1;
}

void printHols(int n, vector<int> holes)
{
    for (int i = 0; i < n - 1; i++)
        cout << holes[i] << " ";

    cout << "! " << holes[n - 1] << endl;
}

int shift(int n, vector<int> &holes, int k)
{
    k--;
    int result;
    if (holes[k] - (n - k) < 0)
        result = holes[k] + k;
    else
        result = (holes[k] - (n - k)) % n; 

    int need = holes[k];
    holes[k] = 0;

    for (int i = k + 1; (i < n) && (need > 0); i++)
    {
        holes[i]++;
        need--;
    }

    while (need > 0)
        for (int i = 0; (i < n) && (need > 0); i++)
        {
            holes[i]++;
            need--;
        }

    printHols(n, holes);

    return result;
}

int mainSolve(int n, vector<int> &holes) 
{
    vector<int> newHoles = holes;

    for (int i = 0; i < n - 1; i++)
    {
        if (newHoles[i] != 0) // choose first hole with stones
        {
            cout << "\n\nMAIN SOLVE " << i + 1 << endl;
            int res = dop(n, newHoles, i);
            
            if (res)
            {
                newHoles = holes;
                cout << "res";
                continue;
            }
            else
            {
                mainResult.insert(mainResult.end(), i + 1);
                return 0;
            }
        }
    }

    return 1;
}

// int home(int n, vector<int> &holes) 
// {
//     vector<int> newHoles = holes;

//     for (int i = 0; i < n - 1; i++)
//     {
//         if (newHoles[i] != 0) // choose first hole with stones
//         {
//             // cout << "\n\nHOME " << i + 1 << endl;
//             cout << i + 1 << endl;
//             int res = dop(n, newHoles, i);
            
//             if (res)
//             {
//                 newHoles = holes;
//                 continue;
//             }
//             else
//             {
//                 mainResult.insert(mainResult.end(), i + 1);
//                 return 0;
//             }
//         }
//     }

//     return 1;
// }

int dop(int n, vector<int> &holes, int i)
{
    int resPos = shift(n, holes, i + 1);

    if (isWin(n, holes))
    {
        cout << "Win\n";
        // mainResult.insert(mainResult.end(), i + 1);
        return 0;
    }

    cout << "RES POS " << resPos << " " << n - 1 << endl;

    if (resPos == n - 1)
    {
        cout << "HOME\n";  // попали в хоум, у нас 3 варианта развития событий
        int res = mainSolve(n, holes);

        if (!res)
        {
            // mainResult.insert(mainResult.end(), i + 1);
            return 0;
        }
    }
    else if (holes[resPos] == 1)
    {
        cout << "YOU LOSE\n\n";
        return 1;
    }
    else
    {
        cout << resPos + 1 << endl;
        int resDop = dop(n, holes, resPos);

        if (resDop == 0)
        {
            mainResult.insert(mainResult.end(), resPos + 1);
            return 0;
        }
    }

    return 1;
}

int main()
{
    cout << "Чука Рума - редчайшая разновидность однорядной манкалы для одного игрока.\n\n";
    cout << "Правила игры:\n\
Есть n маленьких лунок, расположенных слева направо. Справа от лунок есть большая лунка - Дом.\n\
В каждой из лунок есть k камней (семен). Для хода игрок берёт все камни из любой лунки и раскладывает их\n\
по одному в каждую лунку слева направо, по направлению к Дому, не пропуская ни одной.\n\
Цель игры состоит в том, чтобы перенести ВСЕ камни в Дом.\n\n\
При посеве:\n\
- если последний камень при посеве падает в пустую лунку, игра заканчивается, пасьянс не сошёлся;\n\
- если последний камень падает в непустую лунку, игрок берёт все камни из этой лунки и продолжает посев\n\
в том же направлении, начиная со следующей лунки;\n\
- если камень падает в Дом, и в руке остались камни, посев продолжается с первой лунки слева.\n\
- если посев заканчивается в Доме, игрок может начать новый посев камнями из любой маленькой лунки;\n\n";

    int n;

    cout << "Введите количество лунок: ";
    cin >> n;

    n++;

    vector<int> holes(n);

    for (int i = 0; i < n - 1; i++)
    {
        cout << "Введите количество камней в " << i + 1 << " лунке: ";
        cin >> holes[i];
    }

    printHols(n, holes);

    mainSolve(n, holes);
    // shift(n, holes, 4);

    // printHols(n, holes);

    cout << "\n\n\nMain result\n";

    for (int i = 0; i < mainResult.size(); i++)
        cout << mainResult[i] << " ";
    return 0;
}
