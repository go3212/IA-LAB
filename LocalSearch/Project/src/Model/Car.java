package Model;

import IA.Comparticion.Usuario;
import java.util.ArrayList;

public class Car
{
    private Usuario m_Owner;
    private ArrayList<Usuario> m_Users;

    public Car(Usuario owner)
    {
        this.m_Owner = owner;
        this.m_Users = new ArrayList<>();
    }

    public Car(Usuario owner, ArrayList<Usuario> m_Users)
    {
        this.m_Owner = owner;
        this.m_Users = m_Users;
    }
}
