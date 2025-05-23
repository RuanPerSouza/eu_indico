import tkinter as tk
from tkinter import messagebox
from cone import conectar

generos_filmes = {
    "Ação": [
        {"nome": "Vingadores: Ultimato", "sinopse": "Após os eventos devastadores de 'Guerra Infinita', Após os devastadores eventos de Vingadores: Guerra Infinita, onde o vilão Thanos eliminou metade de toda a vida no universo com um estalar de dedos usando as Joias do Infinito, os poucos heróis restantes enfrentam um mundo em ruínas e um futuro incerto. Com Tony Stark desaparecido e Steve Rogers liderando um grupo dividido, eles precisam superar suas diferenças e reunir forças para encontrar uma maneira de reverter o genocídio cósmico.a envolve viagens no tempo por diferentes momentos da história dos heróis, resgatando fragmentos do passado para juntar as Joias do Infinito novamente. Essa missão coloca os Vingadores em confrontos épicos, sacrifícios pessoais e decisões difíceis, culminando em uma batalha final de proporções gigantescas contra Thanos e seu exército, onde o destino do universo inteiro está em jogo."},
        {"nome": "Mad Max: Estrada da Fúria", "sinopse": "Num futuro distópico pós-apocalíptico, Max une forças com Furiosa para libertar um grupo de mulheres da tirania de Immortan Joe. A fuga é uma jornada alucinante em um mundo árido e violento."},
        {"nome": "John Wick", "sinopse": "John Wick, um ex-assassino de elite, volta à ativa para vingar a morte de seu cachorro, último presente de sua falecida esposa. Uma ação estilizada que mostra sua implacável busca por justiça."}
    ],
    "Drama": [
        {"nome": "À Procura da Felicidade", "sinopse": "Chris Gardner enfrenta uma série de desafios financeiros enquanto tenta criar seu filho sozinho, lutando contra o desespero e a pobreza para construir uma vida melhor."},
        {"nome": "O Curioso Caso \nde Benjamin Button", "sinopse": "Benjamin nasce com a aparência de um homem idoso e rejuvenesce com o passar do tempo, vivendo uma vida incomum que desafia a passagem normal do tempo e explora a natureza da existência."},
        {"nome": "Forrest Gump", "sinopse": "A história de Forrest, um homem simples e gentil que testemunha e influencia momentos cruciais da história americana, enquanto busca o amor de sua vida e descobre o significado da vida."}
    ],
    "Fantasia": [
        {"nome": "Harry Potter", "sinopse": "Um jovem órfão descobre que é bruxo e é levado para a escola de magia de Hogwarts, onde enfrenta desafios, amigos, inimigos e o destino de todo o mundo mágico."},
        {"nome": "Senhor dos Anéis", "sinopse": "Frodo, um hobbit relutante, embarca em uma perigosa jornada para destruir um anel maligno que pode trazer a escuridão eterna ao seu mundo, enfrentando perigos e aliados ao longo do caminho."},
        {"nome": "Alice no País das \nMaravilhas", "sinopse": "Alice cai numa toca de coelho e encontra um mundo fantástico cheio de personagens excêntricos e situações absurdas, desafiando sua percepção da realidade."}
    ],
    "Comédia": [
        {"nome": "Superbad", "sinopse": "Dois adolescentes desajeitados tentam aproveitar ao máximo os últimos dias do ensino médio, enfrentando situações embaraçosas e tentando impressionar as garotas que gostam."},
        {"nome": "Se Beber, Não Case!", "sinopse": "Após uma despedida de solteiro em Las Vegas, três amigos acordam sem memória da noite anterior e tentam juntar as peças para encontrar o noivo desaparecido."},
        {"nome": "A Mentira", "sinopse": "Uma adolescente popular espalha uma mentira para aumentar sua popularidade, mas logo se vê em apuros para manter a farsa."}
    ],
    "Terror": [
        {"nome": "Invocação do Mal", "sinopse": "Investigadores paranormais Ed e Lorraine Warren tentam ajudar uma família aterrorizada por uma presença maligna em sua fazenda."},
        {"nome": "O Exorcista", "sinopse": "Uma garota jovem é possuída por uma entidade demoníaca e sua mãe busca a ajuda de padres para tentar salvar sua filha com um exorcismo."},
        {"nome": "It: A Coisa", "sinopse": "Um grupo de crianças enfrenta seus medos mais profundos ao confrontar uma entidade maléfica que assume a forma de um palhaço assustador."}
    ],
    "Romance": [
        {"nome": "Diário de uma Paixão", "sinopse": "Um homem idoso lê para uma mulher as memórias de um amor jovem e intenso que enfrentou obstáculos ao longo da vida."},
        {"nome": "Orgulho e Preconceito", "sinopse": "Na Inglaterra do século XIX, Elizabeth Bennet lida com questões de classe, moralidade e amor ao encontrar o orgulhoso Sr. Darcy."},
        {"nome": "Titanic", "sinopse": "Um romance improvável surge a bordo do navio Titanic entre Jack, um artista pobre, e Rose, uma jovem de alta sociedade."}
    ]
}

generos_livros = {
    "Ação": [
        {"nome": "O Conde de Monte Cristo", "sinopse": "Após ser injustamente preso, Edmond Dantès escapa da prisão, encontra um tesouro escondido e busca vingança contra aqueles que o traíram."},
        {"nome": "Jogos Vorazes", "sinopse": "Katniss Everdeen é forçada a competir em um reality show mortal, onde adolescentes lutam até a morte, enquanto desafia o regime opressor de seu país."},
        {"nome": "O Código Da Vinci", "sinopse": "O simbologista Robert Langdon se envolve em uma corrida contra o tempo para desvendar uma conspiração religiosa milenar escondida em obras de arte."}
    ],
    "Drama": [
        {"nome": "O diário de \nAnne Frank", "sinopse": "Durante a Segunda Guerra Mundial, uma menina encontra consolo em livros enquanto o mundo ao seu redor desmorona."},
        {"nome": "Os Miseráveis", "sinopse": "Jean Valjean busca redenção após anos na prisão, enfrentando injustiças sociais na França do século XIX."},
        {"nome": "O Sol é para Todos", "sinopse": "Uma menina narra as tensões raciais em uma pequena cidade americana durante o julgamento de um homem negro acusado injustamente."}
    ],
    "Fantasia": [
        {"nome": "Harry Potter e a \nPedra Filosofal", "sinopse": "Um garoto descobre ser um bruxo e começa seus estudos em Hogwarts, onde precisa enfrentar perigos e descobrir seu papel no mundo mágico."},
        {"nome": "O Hobbit", "sinopse": "Bilbo Bolseiro embarca em uma jornada inesperada com anões para recuperar um tesouro guardado por um dragão."},
        {"nome": "As Crônicas de Nárnia", "sinopse": "Quatro irmãos entram em um guarda-roupa mágico e descobrem o mundo de Nárnia, onde devem ajudar a derrotar uma feiticeira maligna."}
    ],
    "Comédia": [
        {"nome": "O Guia do Mochileiro \ndas Galáxias", "sinopse": "Após a Terra ser destruída, Arthur Dent embarca em uma jornada absurda pelo espaço com alienígenas e robôs sarcásticos."},
        {"nome": "Dom Casmurro", "sinopse": "Bentinho narra sua história de ciúmes e desconfiança com Capitu, numa mistura de drama e ironia clássica da literatura brasileira."},
        {"nome": "Triste Fim de \nPolicarpo Quaresma", "sinopse": "Um patriota exagerado tenta mudar o Brasil com ideias cômicas e absurdas — como propor o tupi como idioma oficial."}
    ],
    "Terror": [
        {"nome": "Drácula", "sinopse": "O conde vampiro da Transilvânia se muda para Londres, espalhando o terror enquanto é caçado por um grupo liderado por Van Helsing."},
        {"nome": "Frankenstein", "sinopse": "Victor Frankenstein cria uma criatura em um experimento ambicioso, mas acaba sendo perseguido pelo monstro que criou."},
        {"nome": "O Iluminado", "sinopse": "Jack Torrance enlouquece em um hotel isolado durante o inverno, colocando sua família em perigo sob influências sobrenaturais."}
    ],
    "Romance": [
        {"nome": "Orgulho e Preconceito", "sinopse": "Elizabeth Bennet enfrenta os preconceitos da sociedade inglesa ao se envolver com o enigmático Sr. Darcy."},
        {"nome": "Eleanor & Park", "sinopse": "Dois adolescentes socialmente deslocados se apaixonam nos anos 80, desafiando preconceitos e o ambiente familiar conturbado."},
        {"nome": "A Culpa é das Estrelas", "sinopse": "Dois adolescentes com câncer compartilham uma jornada de amor, perdas e descobertas profundas sobre a vida."}
    ]
}


avaliacoes_livros = []
avaliacoes_filmes = []
livro_selecionado = None
filme_selecionado = None


janela = tk.Tk()
janela.title("Avaliação de Filmes e Livros")
janela.configure(bg="#fff6f0")
janela.geometry("800x700")
janela.resizable(False, False)

conteudo_frame = tk.Frame(janela, bg="#fff6f0")
conteudo_frame.pack(pady=20)

nota_var = tk.IntVar(value=0)

# Para controle simples de telas 
tela_anterior = []

def limpar_conteudo():
    for widget in conteudo_frame.winfo_children():
        widget.destroy()

def avaliar_estrelas(n):
    for i in range(5):
        estrelas[i].config(text="★" if i < n else "☆")
    nota_var.set(n)

def botao_voltar():
    if tela_anterior:
        func = tela_anterior.pop()
        func()
    else:
        mostrar_inicio()

def adicionar_botao_voltar():
    btn_voltar = tk.Button(conteudo_frame, text="Voltar", bg="#f0a500", font=("Georgia", 11, "bold"), command=botao_voltar)
    btn_voltar.pack(side=tk.BOTTOM, pady=15)

def mostrar_inicio():
    limpar_conteudo()
    tela_anterior.clear()
    tk.Label(conteudo_frame, text="Escolha uma opção:", font=("Georgia", 18, "bold"), bg="#fff6f0").pack(pady=20)
    tk.Button(conteudo_frame, text="Filmes", font=("Georgia", 14), bg="#c0e8e0", width=20,
    command=lambda: mudar_tela(mostrar_generos)).pack(pady=10)
    tk.Button(conteudo_frame, text="Livros", font=("Georgia", 14), bg="#f4cccc", width=20,
    command=lambda: mudar_tela(mostrar_generos_livro)).pack(pady=10)

def mudar_tela(func):
    tela_anterior.append(mostrar_inicio)
    func()

def mostrar_generos():
    limpar_conteudo()
    tela_anterior.append(mostrar_inicio)
    tk.Label(conteudo_frame, text="Escolha um gênero:", font=("Georgia", 16, "bold"), bg="#fff6f0").pack(pady=10)
    for genero in generos_filmes.keys():
        tk.Button(conteudo_frame, text=genero, font=("Georgia", 13), bg="#d9ead3", width=20,
    command=lambda g=genero: mudar_tela(lambda: mostrar_filmes(g))).pack(pady=5)
    adicionar_botao_voltar()

def mostrar_generos_livro():
    limpar_conteudo()
    tela_anterior.append(mostrar_inicio)
    tk.Label(conteudo_frame, text="Escolha um gênero:", font=("Georgia", 16, "bold"), bg="#fff6f0").pack(pady=10)
    for genero in generos_livros.keys():
        tk.Button(conteudo_frame, text=genero, font=("Georgia", 13), bg="#d9ead3", width=20,
    command=lambda g=genero: mudar_tela(lambda: mostrar_livros(g))).pack(pady=5)
    adicionar_botao_voltar()

def mostrar_filmes(genero):
    limpar_conteudo()
    tela_anterior.append(mostrar_generos)
    tk.Label(conteudo_frame, text=f"Filmes de {genero}", font=("Georgia", 16, "bold"), bg="#fff6f0").pack(pady=10)
    for filme in generos_filmes[genero]:
        tk.Button(conteudo_frame, text=filme["nome"], font=("Georgia", 12), width=30,
    bg="#f9cb9c", command=lambda f=filme: mudar_tela(lambda: mostrar_avaliacao_filmes(f))).pack(pady=5)
    adicionar_botao_voltar()

def mostrar_livros(genero):
    limpar_conteudo()
    tela_anterior.append(mostrar_generos_livro)
    tk.Label(conteudo_frame, text=f"livro de {genero}", font=("Georgia", 16, "bold"), bg="#fff6f0").pack(pady=10)
    for livro in generos_livros[genero]:
        tk.Button(conteudo_frame, text=livro["nome"], font=("Georgia", 12), width=30,
    bg="#f9cb9c", command=lambda f=livro: mudar_tela(lambda: mostrar_avaliacao_livros(f))).pack(pady=5)
    adicionar_botao_voltar()

def mostrar_avaliacao_filmes(filme):
    global filme_selecionado
    limpar_conteudo()
    filme_selecionado = filme
    tela_anterior.append(lambda: mostrar_filmes(procurar_genero_do_filme(filme)))

    tk.Label(conteudo_frame, text=filme["nome"], font=("Georgia", 16, "bold"), bg="#fff6f0").pack(pady=5)
    tk.Label(conteudo_frame, text="Sinopse:", font=("Georgia", 12, "bold"), bg="#fff6f0").pack(anchor="w", padx=20)
    tk.Label(conteudo_frame, text=filme["sinopse"], font=("Palatino Linotype", 12),
    wraplength=600, justify="left", bg="#fff6f0").pack(anchor="w", padx=20, pady=5)

    global estrelas
    estrelas = []
    estrela_frame = tk.Frame(conteudo_frame, bg="#fff6f0")
    estrela_frame.pack(pady=10)
    for i in range(1, 6):
        estrela = tk.Label(estrela_frame, text="☆", font=("Arial", 24), fg="#FFD700", bg="#fff6f0", cursor="hand2")
        estrela.pack(side=tk.LEFT)
        estrela.bind("<Button-1>", lambda e, n=i: avaliar_estrelas(n))
        estrelas.append(estrela)

    tk.Label(conteudo_frame, text="Comentário:", font=("Georgia", 12), bg="#fff6f0").pack(pady=5)
    comentario_entry = tk.Text(conteudo_frame, height=4, width=60, font=("Palatino Linotype", 12))
    comentario_entry.pack()

    def salvar():
        nota = nota_var.get()
        comentario = comentario_entry.get("1.0", tk.END).strip()
        if nota == 0 or not comentario:
            messagebox.showwarning("Atenção", "Dê uma nota e escreva um comentário.")
            return
        avaliacoes_filmes.append({"filme": filme["nome"], "nota": nota, "comentario": comentario})
        messagebox.showinfo("Sucesso", "Avaliação salva com sucesso!")
        mostrar_inicio()

    tk.Button(conteudo_frame, text="Salvar Avaliação", command=salvar,
    bg="#b6d7a8", font=("Georgia", 12)).pack(pady=10)

    tk.Button(conteudo_frame, text="Ver Avaliações", command=lambda: mudar_tela(mostrar_avaliacoes_filmes),
    bg="#c0e8e0", font=("Georgia", 11), width=20).pack(pady=5)

    adicionar_botao_voltar()

def mostrar_avaliacao_livros(livro):
    global livro_selecionado
    limpar_conteudo()
    livro_selecionado = livro
    tela_anterior.append(lambda: mostrar_livros(procurar_genero_do_livro(livro)))


    tk.Label(conteudo_frame, text=livro["nome"], font=("Georgia", 16, "bold"), bg="#fff6f0").pack(pady=5)
    tk.Label(conteudo_frame, text="Sinopse:", font=("Georgia", 12, "bold"), bg="#fff6f0").pack(anchor="w", padx=20)
    tk.Label(conteudo_frame, text=livro["sinopse"], font=("Palatino Linotype", 12),
    wraplength=600, justify="left", bg="#fff6f0").pack(anchor="w", padx=20, pady=5)


    global estrelas
    estrelas = []
    estrela_frame = tk.Frame(conteudo_frame, bg="#fff6f0")
    estrela_frame.pack(pady=10)
    for i in range(1, 6):
        estrela = tk.Label(estrela_frame, text="☆", font=("Arial", 24), fg="#FFD700", bg="#fff6f0", cursor="hand2")
        estrela.pack(side=tk.LEFT)
        estrela.bind("<Button-1>", lambda e, n=i: avaliar_estrelas(n))
        estrelas.append(estrela)

    tk.Label(conteudo_frame, text="Comentário:", font=("Georgia", 12), bg="#fff6f0").pack(pady=5)
    comentario_entry = tk.Text(conteudo_frame, height=4, width=60, font=("Palatino Linotype", 12))
    comentario_entry.pack()

    def salvar():
        nota = nota_var.get()
        comentario = comentario_entry.get("1.0", tk.END).strip()
        if nota == 0 or not comentario:
            messagebox.showwarning("Atenção", "Dê uma nota e escreva um comentário.")
            return
        avaliacoes_livros.append({"Livro": livro["nome"], "nota": nota, "comentario": comentario})
        messagebox.showinfo("Sucesso", "Avaliação salva com sucesso!")
        mostrar_inicio()

    tk.Button(conteudo_frame, text="Salvar Avaliação", command=salvar,
    bg="#b6d7a8", font=("Georgia", 12)).pack(pady=10)

    tk.Button(conteudo_frame, text="Ver Avaliações", command=lambda: mudar_tela(mostrar_avaliacoes_livros),
    bg="#c0e8e0", font=("Georgia", 11), width=20).pack(pady=5)

    adicionar_botao_voltar()

def procurar_genero_do_filme(filme):
    for genero, filmes in generos_filmes.items():
        if filme in filmes:
            return genero
    return None

def procurar_genero_do_livro(livro):
    for genero, lista in generos_livros.items():
        if livro in lista:
            return genero
    return None

def mostrar_avaliacoes_filmes():
    limpar_conteudo()
    tela_anterior.append(mostrar_inicio)

    tk.Label(conteudo_frame, text="Avaliações de Filmes", font=("Georgia", 16, "bold"), bg="#fff6f0").pack(pady=10)

    if not avaliacoes_filmes:
        tk.Label(conteudo_frame, text="Nenhuma avaliação feita ainda.", font=("Palatino Linotype", 12), bg="#fff6f0").pack()
        adicionar_botao_voltar()
        return

    LIMITE_SCROLL = 2  # Quantidade mínima para mostrar o scroll

    if len(avaliacoes_filmes) > LIMITE_SCROLL:
        container = tk.Frame(conteudo_frame, bg="#fff6f0", width= 350)
        container.pack(fill="both", expand=True, padx=10, pady=5)

        canvas = tk.Canvas(container, bg="#fff6f0", highlightthickness=0)
        scrollbar = tk.Scrollbar(container, orient="vertical", command=canvas.yview)
        scroll_frame = tk.Frame(canvas, bg="#fff6f0")

        scroll_frame.bind(
            "<Configure>",
            lambda e: canvas.configure(scrollregion=canvas.bbox("all"))
        )

        canvas.create_window((0, 0), window=scroll_frame, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)

        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")

        frame_pai = scroll_frame
    else:
        frame_pai = conteudo_frame

    for idx, aval in enumerate(avaliacoes_filmes):
        frame = tk.Frame(frame_pai, bg="#fdf4f4", bd=1, relief="solid", padx=10, pady=5)
        frame.pack(pady=5, fill="x", padx=20)

        tk.Label(frame, text=f"🎬 Filme: {aval['filme']}", font=("Georgia", 12, "bold"), bg="#fdf4f4").pack(anchor="w")
        estrelas_text = "★" * aval["nota"] + "☆" * (5 - aval["nota"])
        tk.Label(frame, text=f"Avaliação: {estrelas_text}", font=("Arial", 12), fg="#FFD700", bg="#fdf4f4").pack(anchor="w")
        tk.Label(frame, text=f"Comentário: {aval['comentario']}", font=("Palatino Linotype", 11), wraplength=500, bg="#fdf4f4", justify="left").pack(anchor="w")

        def deletar_avaliacao_filmes(i=idx):
            confirm = messagebox.askyesno("Confirmação", "Deseja realmente deletar essa avaliação?")
            if confirm:
                avaliacoes_filmes.pop(i)
                mostrar_avaliacoes_filmes()

        tk.Button(frame, text="Deletar Avaliação", bg="#f4cccc", font=("Georgia", 10), command=deletar_avaliacao_filmes).pack(anchor="e", pady=5)

    adicionar_botao_voltar()




    
def mostrar_avaliacoes_livros():
    limpar_conteudo()
    tela_anterior.append(mostrar_inicio)
    tk.Label(conteudo_frame, text="Avaliações de Livros", font=("Georgia", 16, "bold"), bg="#fff6f0").pack(pady=10)

    if not avaliacoes_livros:
        tk.Label(conteudo_frame, text="Nenhuma avaliação feita ainda.", font=("Palatino Linotype", 12), bg="#fff6f0").pack()
        adicionar_botao_voltar()
        return

    LIMITE_SCROLL = 2  # número mínimo de avaliações antes de ativar o scroll

    if len(avaliacoes_livros) > LIMITE_SCROLL:
        container = tk.Frame(conteudo_frame, bg="#fff6f0", width= 350) 
        container.pack(fill="both", expand=True, padx=10, pady=5)

        canvas = tk.Canvas(container, bg="#fff6f0", highlightthickness=0)
        scrollbar = tk.Scrollbar(container, orient="vertical", command=canvas.yview)
        scroll_frame = tk.Frame(canvas, bg="#fff6f0")

        scroll_frame.bind(
            "<Configure>",
            lambda e: canvas.configure(scrollregion=canvas.bbox("all"))
        )

        canvas.create_window((0, 0), window=scroll_frame, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)

        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")

        frame_pai = scroll_frame
    else:
        frame_pai = conteudo_frame

    for idx, aval in enumerate(avaliacoes_livros):
        frame = tk.Frame(frame_pai, bg="#fdf4f4", bd=1, relief="solid", padx=10, pady=5)
        frame.pack(pady=5, fill="x", padx=20)

        tk.Label(frame, text=f"📚 Livro: {aval['Livro']}", font=("Georgia", 12, "bold"), bg="#fdf4f4").pack(anchor="w")
        estrelas_text = "★" * aval["nota"] + "☆" * (5 - aval["nota"])
        tk.Label(frame, text=f"Avaliação: {estrelas_text}", font=("Arial", 12), fg="#FFD700", bg="#fdf4f4").pack(anchor="w")
        tk.Label(frame, text=f"Comentário: {aval['comentario']}", font=("Palatino Linotype", 11), wraplength=500, bg="#fdf4f4", justify="left").pack(anchor="w")

        def deletar_avaliacao_livros(i=idx):
            confirm = messagebox.askyesno("Confirmação", "Deseja realmente deletar essa avaliação?")
            if confirm:
                avaliacoes_livros.pop(i)
                mostrar_avaliacoes_livros()

        tk.Button(frame, text="Deletar Avaliação", bg="#f4cccc", font=("Georgia", 10), command=deletar_avaliacao_livros).pack(anchor="e", pady=5)

    adicionar_botao_voltar()



mostrar_inicio()
janela.mainloop()
